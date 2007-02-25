From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8081] Conservative governor sets wrong and too high sampling
	rates
Date: Sun, 25 Feb 2007 08:37:20 -0800
Message-ID: <200702251637.l1PGbKho022062@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8081





------- Additional Comments From ferriste@libero.it  2007-02-25 08:37 -------
Created an attachment (id=10530)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=10530&action=view)
This is a simple patch to fix the bug. Apply it at conservative.c


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
