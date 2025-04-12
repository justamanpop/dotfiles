return {
  -- struct
  s(
    'tys',
    fmt(
      [[
    type {} struct {{
      {}
    }}
    ]],
      {
        i(1),
        i(2),
      }
    )
  ),

  --interface
  s(
    'tyi',
    fmt(
      [[
    type {} interface {{
      {}
    }}
    ]],
      {
        i(1),
        i(2),
      }
    )
  ),

  --if
  s(
    'if',
    fmt(
      [[
    if {} {{
      {}
    }}
    ]],
      {
        i(1),
        i(2),
      }
    )
  ),

  --if else
  s(
    'ifel',
    fmt(
      [[
    if {} {{
      {}
    }} else {{
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

  --if err nil
  s(
    'ifer',
    fmt(
      [[
    if err != nil {{
      {}
    }}
    ]],
      {
        i(1),
      }
    )
  ),
}
