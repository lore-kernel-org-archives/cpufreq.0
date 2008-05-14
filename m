From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 4379] Default sampling rates for ondemand governor are too high
	on a amd64
Date: Wed, 14 May 2008 06:39:33 -0700 (PDT)
Message-ID: <20080514133933.7B50A11D108@picon.linux-foundation.org>
References: <bug-4379-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-4379-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=4379


kernel-io@fionn.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel-io@fionn.de




------- Comment #7 from kernel-io@fionn.de  2008-05-14 06:39 -------
This problem has has been HUGELY WORSENED in kernel 2.6.25 since someone
apparently opted to RAISE the minimum sampling rate to whopping 2500000.
Even with the minimum settings, the ondemand governor now acts so sluggish that
it is basically unusuable. I had to switch to userspace governor and powernowd
which I consider a significant step backwards.

Would someone with sufficient rights please add 2.6.25 to the kernel version in
bugzilla? Otherwise I'll open a new bug for that version soon.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
