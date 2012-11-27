From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Tue, 27 Nov 2012 02:52:31 +0000 (UTC)
Message-ID: <20121127025231.D752111F883@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721





--- Comment #5 from Len Brown <lenb@kernel.org>  2012-11-27 02:52:31 ---
re: /proc/cpuinfo MHz value

I don't think that is used for anything, or means anything.
We really should delete that, as all it does is confuse people.

re: turbostat output

yes, it looks like you are stuck at high frequency
even when mostly idle, but this condition goes away after
suspend/resume.  Does the system behave normally after
it breaks out of the initial problem?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
