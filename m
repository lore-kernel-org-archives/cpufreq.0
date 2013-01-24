From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug
 51741]=?UTF-8?Q?=20powernow=2Dk8=20calls=20for=20acpi=2Dcpufreq=20but=20doesn=E2=80=99t=20warn=20if=20it=E2=80=99s=20not=20available?=
Date: Thu, 24 Jan 2013 22:18:27 +0000 (UTC)
Message-ID: <20130124221827.E834E11FC70@bugzilla.kernel.org>
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


Andreas <linuxuser330250@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |PATCH_ALREADY_AVAILABLE




--- Comment #1 from Andreas <linuxuser330250@gmx.net>  2013-01-24 22:18:27 ---
This should be fixed now.

The patch titled

    powernow-k8: Add a kconfig dependency on acpi-cpufreq

was added to the 3.7-stable tree.

The filename of the patch is:
     powernow-k8-add-a-kconfig-dependency-on-acpi-cpufreq.patch
and it can be found in the queue-3.7 subdirectory.

Since 3.7.4 is already out, I assume it will be part of 3.7.5 and later.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
