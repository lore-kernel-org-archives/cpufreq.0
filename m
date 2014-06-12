From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 16:26:22 +0000
Message-ID: <bug-77201-12968-OVoyJjpFEl@https.bugzilla.kernel.org/>
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

--- Comment #65 from Mauro <registosites@hotmail.com> ---
(In reply to Viresh Kumar from comment #64)
> (In reply to Viresh Kumar from comment #63)
> > Let me try some more hacks :)
> 
> Okay, I can understand that its taking more time than it should have but its
> probably more tricky that we actually thought..
> 
> Don't loose hope, we can still crack this :)

No worries, the bug will be nuked from orbit sooner or later :D

> 
> I have added one more commit now. Idea is to stop ongoing frequency
> transition at any point of time we want.
> 
> By default everything will work as it was working. So, continue upto the
> last step, where you crashed, 1.8G ..
> 
> Before changing last freq do this:
> 
> echo 1 > /sys/kernel/debug/stop_transition
> 
> 
> Follow this in code:
> 
> +       /* HACK THIS */
> +       if (stop_transition)
> +               return 0;
> 
> So, we will return from whichever part of powernowk8_target_fn() we  want.
> I have placed it at some point now, you can drag it in whichever direction
> you want.
> 
> If it works, then drag it later into the code.

I'll move that code around and see if I can find where it crashes. Should I
move it around only inside the function where you put it now
(transition_frequency_fidvid()) or also try other functions?

On that note, since I'm going to be changing only one file and it is built as a
module, is it ok if I do only:
make drivers/cpufreq/powernow-k8.ko?

Also, what is the best and fastest way, if possible, to compile only what
changed?

-- 
You are receiving this mail because:
You are the assignee for the bug.
