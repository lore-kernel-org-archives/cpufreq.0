From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58001] "ondemand" CPU governor never raises frequency (Dell XPS
 12)
Date: Thu, 25 Sep 2014 00:59:15 +0000
Message-ID: <bug-58001-12968-ryHMkllMpZ@https.bugzilla.kernel.org/>
References: <bug-58001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58001

--- Comment #21 from Raymond Auge <rotty3000@gmail.com> ---
Ok this seems to give working governance (2 levels only powersave, performance)

and I'm apparently seeing CPU frequencies beyond those previously available,
which were 800MHz-2000MHz

Now I see:

~]$ sudo dmidecode -t processor | grep MHz
    External Clock: 100 MHz
    Max Speed: 4000 MHz
    Current Speed: 2000 MHz

and the cpu speed in powersave hovers around:

~]$ grep MHz /proc/cpuinfo
cpu MHz        : 1553.320
cpu MHz        : 1560.644
cpu MHz        : 2186.230
cpu MHz        : 1757.519

-- 
You are receiving this mail because:
You are the assignee for the bug.
