From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13035] select for cpufreq/ files
Date: Tue, 1 Feb 2011 01:23:11 GMT
Message-ID: <201102010123.p111NB3Z016674@demeter1.kernel.org>
References: <bug-13035-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-13035-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=13035


ykzhao <yakui.zhao@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yakui.zhao@intel.com




--- Comment #1 from ykzhao <yakui.zhao@intel.com>  2011-02-01 01:23:09 ---
Hi, 
   Why do you expect to use the "select" function for the
scaling_availabe_frequencies interface? What do you want to monitor? It can
immediately return the available frequencies supported by the corresponding
CPU. At most cases the available frequencies can't be changed.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
