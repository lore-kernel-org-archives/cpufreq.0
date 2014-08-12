From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81701] OOPS in cpufreq driver with AMD Kaveri CPU
Date: Tue, 12 Aug 2014 09:19:28 +0000
Message-ID: <bug-81701-12968-DEf1m7RTEZ@https.bugzilla.kernel.org/>
References: <bug-81701-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-81701-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=81701

Ayan <ayankumarh@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ayankumarh@gmail.com

--- Comment #15 from Ayan <ayankumarh@gmail.com> ---
I am trying to recreate the issue on my system. I am running 3.16 kernel on a
x86 machine. I have made a small script which tries to load the cpu( for
increasing the cpu frequency) and then sleeps for some time( to decrease the
cpu frequency). My cpufreq governor is "ondemand". 
My request to you is to use the same script which I will upload and provide me
the last log of the script before the system hangs up. I have been executing
the script for the last one hour but I have not observed any hang-up

-- 
You are receiving this mail because:
You are the assignee for the bug.
