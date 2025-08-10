return {
	--test related

	-- desc
	s(
		"desc",
		fmt(
			[[
    describe('{}', () => {{
      {}
    }}); 
    ]],
			{
				i(1),
				i(2),
			}
		)
	),

	-- beforeAll
	s(
		"ba",
		fmt(
			[[
    beforeAll(() => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- beforeAll async
	s(
		"baa",
		fmt(
			[[
    beforeAll(async () => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- beforeEach
	s(
		"be",
		fmt(
			[[
    beforeEach(() => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- beforeEach async
	s(
		"bea",
		fmt(
			[[
    beforeEach(async () => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- afterAll
	s(
		"aa",
		fmt(
			[[
    afterAll(() => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- beforeAll async
	s(
		"aaa",
		fmt(
			[[
    afterAll(async () => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- afterEach
	s(
		"ae",
		fmt(
			[[
    afterEach(() => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- afterEach async
	s(
		"aea",
		fmt(
			[[
    afterEach(async () => {{
      {}
    }}); 
    ]],
			{
				i(1),
			}
		)
	),

	-- it
	s(
		"it",
		fmt(
			[[
    it('{}', () => {{
      {}
    }}); 
    ]],
			{
				i(1),
				i(2),
			}
		)
	),

	-- it async
	s(
		"ita",
		fmt(
			[[
    it('{}', async () => {{
      {}
    }}); 
    ]],
			{
				i(1),
				i(2),
			}
		)
	),

	-- for loop
	s(
		"for",
		fmt(
			[[
    for(let i = 0; i < {}; i++) {{
      {}
    }}
    ]],
			{
				i(1),
				i(2),
			}
		)
	),

	-- for of loop
	s(
		"forof",
		fmt(
			[[
    for({} of {}) {{
      {}
    }}
    ]],
			{
				i(1),
				i(2),
				i(3),
			}
		)
	),
}
