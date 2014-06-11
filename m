From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 10:28:54 +0000
Message-ID: <bug-77201-12968-hADp7Uwezx@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #31 from Viresh Kumar <viresh.kumar@linaro.org> ---
Hi,

Thanks for your efforts !!

We couldn't get the complete picture as there are just too many prints wanting
to fit on screen :)

Can you try this to get the right set of prints for us, that way we might be
able to focus in the right direction:

- Remove all pr_debug() lines from powernow-k8 driver
- And apply attached patch for cpufreq core, only reducing number of print
messages. (Rebased over 3.15)

And then give us another screenshot..

Also some queries about your current logs:
- I hope this was the last message you saw on screen and it just became
unresponsive?

freq_table: target index is 0, freq is:2200000 kHz

and the expected ones after this are:

powernow_k8: targ: cpu 0, 2200000 kHz, min 800000, max 2200000
powernow_k8: targ: curr fid 0x8, vid 0x15
powernow_k8: cpu 0 transition to index 0
powernow_k8: table matched fid 0xe, giving vid 0x12
powernow_k8: cpu 0, changing to fid 0xe, vid 0x12

So, it looks like the CPU did came back and something happened while changing
freq to max.

Somehow this problem is related to something special being done in your driver.
We don't see this problem otherwise for other platforms.

One thing i could figure out is scheduling a *work* for changing frequencies
but I am not sure if the problem is related to that..

I tried to have a look at what changed between 3.13.8 and 3.14, and couldn't
figure out anything special that might end up in this issue :(


If you couldn't get anything conclusive with above tests then there might be
some chances that it *isn't* related to cpufreq and some other changes in
kernel are responsible. The best we can try is: get only cpufreq back to the
old state, i.e. 3.13.8, by reverting commits and try again..

few reverts were required for this and to simplify your work I have created a
branch with all reverts required.

git://git.linaro.org/people/viresh.kumar/mylinux.git powernow-k8-debugging

NOTE: We can still see some diff this way:
git diff v3.13.8..powernow-k8-debugging -- drivers/cpufreq/ --
include/linux/cpufreq.h

But there shouldn't be any *functional* change for
cpufreq.c/governors/freq-table.c/powernow-k8 drivers and all cpufreq files do
compile.. (haven't tried compiling powernow-k8)..

Let me know if this solves your problem or make it worst :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
