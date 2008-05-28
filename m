From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10654] cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
	gets BUG on Transmeta Crusoe CPU
Date: Wed, 28 May 2008 06:15:43 -0700 (PDT)
Message-ID: <20080528131543.66E83108047@picon.linux-foundation.org>
References: <bug-10654-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10654-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10654





------- Comment #4 from linux@brodo.de  2008-05-28 06:15 -------
Masaki Chikama: your patch at redhat's bugzilla seems to be the proper fix.
Could you submit it to the cpufreq mailing list, please?

@Thomas: this is not p4-clockmod.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
