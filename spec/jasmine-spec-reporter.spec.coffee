require('./test-helper.coffee')

describe 'spec reporter', ->

  describe 'summary', ->

    it 'should report success', ->
      expect(new Test(->
        @describe "suite", ->
          @it "spec", ->
            @passed()
      ).outputs)
      .toContain  "Executed 1 of 1 spec SUCCESS in {time}."


    it 'should report failure', ->
      expect(new Test(->
        @describe "suite", ->
          @it "spec", ->
            @failed()
      ).outputs)
      .toContain  "Executed 1 of 1 spec (1 FAILED) in {time}."


    it 'should report skipped whith success', ->
      expect(new Test(->
        @describe "suite", ->
          @xit "spec", ->
      ).outputs)
      .toContain  "Executed 0 of 1 spec SUCCESS (skipped 1) in {time}."


    it 'should report skipped whith failure', ->
      expect(new Test(->
        @describe "suite", ->
          @xit "spec", ->
          @it "spec", ->
            @failed()
      ).outputs)
      .toContain  "Executed 1 of 2 specs (1 FAILED) (skipped 1) in {time}."
