# Evaluation: Madison Eades Reverse Engineering Code

## Sentence 1: "Income barely budges the needle within traditions"

**Student approach:** Creates income groups (low/med/high), filters to Trump voters only (`vote_2024 == 2`), counts by tradition and income group using `n()`.

**Issues:**

1. **Not using survey weights.** The data includes a `weight` column. All calculations should use `weighted.mean()` with the weight variable, not raw counts.
2. **Filtering to only Trump voters defeats the purpose.** To show that income "barely budges the needle," you need to calculate the *percentage* voting Republican at each income level within a tradition. By pre-filtering to Trump voters, the denominator (total voters at that income/tradition) is lost. Raw counts reflect group size, not vote share.
3. The income grouping via `case_when` is reasonable but verbose — could use range comparisons like `income <= 5 ~ "low"`.

**What should be done:** Calculate `weighted.mean(voted_trump, weight)` by income bracket within a tradition (e.g., White Evangelicals). This shows the Trump vote percentage only varies ~10 points across income brackets, directly demonstrating income "barely budges the needle."

**Verdict:** Does not successfully reproduce the finding. Counting Trump voters without a denominator cannot demonstrate vote share stability across income levels.

---

## Sentence 2: "A Southern Baptist and an atheist with the exact same income are separated by sixty percentage points"

**Student approach:** Creates `vote_by_pres` with income groups and `rep_percent` via `weighted.mean(vote_2024 == 2)`, then separately filters for `baptist == 1` and `trad == "Atheist"`.

**Issues:**

1. **`weighted.mean()` called without a weight argument.** `weighted.mean(vote_2024 == 2)` is equivalent to `mean()` — it doesn't apply survey weights. Should be `weighted.mean(vote_2024 == 2, weight)`.
2. **No direct gap calculation.** The student computes percentages for Southern Baptists and Atheists separately but never directly compares them at the same income level to confirm the ~60 point gap.
3. The student correctly identifies `baptist == 1` as Southern Baptist per the data dictionary — good investigative work.
4. The student's honest self-assessment about incomplete results shows good analytical awareness.

**What should be done:** Filter for the two traditions, use `weighted.mean(voted_trump, weight)` by income bracket, pivot wider, and directly calculate the gap at each income level.

**Verdict:** Partially successful. Right data columns and general logic identified, but missing weight argument and no direct gap comparison mean the finding isn't cleanly reproduced.

---

## Sentence 3: "Trump pulled support from over 80% of white evangelicals and under 10% of Black Protestants"

**Student approach:** Creates `trump_support` filtering for Harris/Trump voters, then separately calculates `mean(vote_2024 == 2) * 100` for each group.

**Issues:**

1. **Not using survey weights.** Uses `mean()` instead of `weighted.mean(..., weight)`.
2. **Inconsistent filtering between the two groups.** `black_prot` is derived from `trump_support` (filtered to vote_2024 == 1 or 2), but `white_evan` is derived from `religion_data` (unfiltered — includes NAs and other vote values). This creates different denominators. For White Evangelicals, NAs in `vote_2024` pull the percentage down.
3. Student gets 12.2% for Black Protestants (article says under 10%) and 78.1% for White Evangelicals (article says over 80%). The inconsistent filtering and lack of weights explain the discrepancy.

**What should be done:** Filter both traditions consistently (exclude NA on `vote_2024`), and use `weighted.mean(voted_trump, weight)`.

**Verdict:** Logic is sound and results are in the right ballpark, but inconsistent filtering and missing weights prevent accurate reproduction.

---

## Overall Assessment

The student demonstrates good analytical thinking and honest self-reflection. The main recurring issue across all three sentences is **not using survey weights** — the `weight` column is never used despite the data containing it. The conceptual approach in Sentence 1 (counting instead of calculating percentages) is the most significant methodological error. Sentences 2 and 3 have the right general logic but need weights and consistent filtering to produce accurate results.
