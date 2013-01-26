From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug
 51741]=?UTF-8?Q?=20powernow=2Dk8=20calls=20for=20acpi=2Dcpufreq=20but=20doesn=E2=80=99t=20warn=20if=20it=E2=80=99s=20not=20available?=
Date: Sat, 26 Jan 2013 10:50:08 +0000 (UTC)
Message-ID: <20130126105008.A134411FC76@bugzilla.kernel.org>
References: <bug-51741-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-51741-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=51741


Florian Mickler <florian@mickler.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |florian@mickler.org




--- Comment #2 from Florian Mickler <florian@mickler.org>  2013-01-26 10:50:08 ---
A patch referencing this bug report has been merged in Linux v3.8-rc5:

commit 631e8ac18fd59722e7ceb15fceeef3f368c250f9
Author: Borislav Petkov <bp@suse.de>
Date:   Fri Jan 18 00:19:37 2013 +0100

    powernow-k8: Add a kconfig dependency on acpi-cpufreq

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
