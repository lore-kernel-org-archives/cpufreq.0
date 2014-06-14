From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Sat, 14 Jun 2014 20:05:26 +0000
Message-ID: <bug-77201-12968-hLGToKsLFD@https.bugzilla.kernel.org/>
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

--- Comment #75 from Mauro <registosites@hotmail.com> ---
(In reply to Viresh Kumar from comment #71)

> > I'd say my initial bisect might be very close to the source of the problem,
> 
> You meant the new hack ?

What I meant was, when I was doing the bisect (the one I attached with the
initial bug report) I was testing if the machine suspended and resumed well. At
the time I had no idea of what the problem was, but now I see that it was
hanging when trying to bring the cpu online (during resume).

I've tested your latest changes and now the machine hangs, I'll be attaching
the logs from this and last test.

-- 
You are receiving this mail because:
You are the assignee for the bug.
