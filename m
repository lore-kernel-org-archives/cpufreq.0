From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Mon, 05 May 2014 18:52:26 +0000
Message-ID: <bug-75121-12968-Nbiwde7k7j@https.bugzilla.kernel.org/>
References: <bug-75121-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75121-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75121

--- Comment #17 from Doug Smythies <dsmythies@telus.net> ---
(In reply to Dirk Brandewie from comment #16)
> (In reply to Doug Smythies from comment #15)
> > Hi Dirk: Did you ever figure out for certain why some had the CPU freq
> > remains high after suspend issue? It remains unclear to me, and I do not
> > know how to even try to re-create here on my test computer.
> > 
> 
> I could make it happen occasionally on my ivy bridge laptop test system.
> 
> I think it have to the hardware coordination on the chip but I haven't
> proven that.
>  

I have figured out how to "suspend" my test computer. I have tried a few times,
but so far haven't been able to re-create the issue. I wanted to be able to
re-create the issue, as a base line reference, so that I would know how far I
can adjust C0_WEIGHT or C0_MINIMUM and still have the issue never occur.

It still doesn't make sense to me that the intel_pstate driver would work fine
before but not after a "suspend". If the root issue is some hardware
coordination on the chip, then shouldn't that be fixed (if possible via
whatever re-initialization) rather than messing with the intel_pstate servo
loop? If it is not some hardware coordination on the chip, but rather due to
some flaw in the servo loop, then we should be able to re-create the issue
without any intervening "suspend".

-- 
You are receiving this mail because:
You are the assignee for the bug.
