From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Tue, 10 Jun 2014 14:42:22 +0000
Message-ID: <bug-77201-12968-FzGTZy90p8@https.bugzilla.kernel.org/>
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

--- Comment #23 from registosites@hotmail.com ---
> Hi,
> 
> Have you missed the most important log? Offline/online with
> Hang..
> 
> In your case both CPUs share clock line and so it doesn't matter
> which cpu you play with.

I don't know how to get the log from when the machine hangs, I've tried:

echo 1 > /sys/devices/system/cpu/cpu1/online ; dmesg > hang.log

When trying to execute that the machine hangs and I have to do a hard reset.
After booting and fsck I don't have any traces of hang.log in the filesystem.

If there is any other way to get the logs I'll need guidance or pointers on how
to do it. In any case  I'm attaching the log of cpu offline with the ondemand
cpu governor and powernow-k8 loaded.

-- 
You are receiving this mail because:
You are the assignee for the bug.
