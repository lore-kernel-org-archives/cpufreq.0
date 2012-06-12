From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 43284] CPU stuck at minimum frequency - HP Compaq 6715b
Date: Tue, 12 Jun 2012 03:11:28 +0000 (UTC)
Message-ID: <20120612031128.A23EB1205D7@bugzilla.kernel.org>
References: <bug-43284-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-43284-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43284


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lenb@kernel.org




--- Comment #5 from Len Brown <lenb@kernel.org>  2012-06-12 03:11:27 ---
Dmitry,
is your laptop over-heating?
Please monitor:

grep . /sys/class/thermal/thermal*/*

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
