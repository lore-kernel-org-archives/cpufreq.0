From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10144] Wrong cpufreq speeds detected when overclocking (speeds
	reported using stock FSB, not overclocked)
Date: Sun,  2 Mar 2008 15:20:32 -0800 (PST)
Message-ID: <20080302232032.56CA8108068@picon.linux-foundation.org>
References: <bug-10144-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10144-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10144





------- Comment #8 from knuckles@gmail.com  2008-03-02 15:20 -------
Created an attachment (id=15113)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=15113&action=view)
acpidump --addr 0x2F0 --length 0x0143x0143 >ssdte_cpu2.dump


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
