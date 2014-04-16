From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Wed, 16 Apr 2014 08:57:28 +0000
Message-ID: <bug-73781-12968-wlyTdcD0t4@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

Stuart Foster <smf.linux@ntlworld.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |smf.linux@ntlworld.com

--- Comment #10 from Stuart Foster <smf.linux@ntlworld.com> ---
Just found the same problem with a Thinkpad R51 (3.14.1 Kernel). From my
investigations the problem was introduced prior 3.14.0-rc1. How is the bisect
going ?

-- 
You are receiving this mail because:
You are the assignee for the bug.
