From: bugme-daemon@osdl.org
Subject: [Bug 3855] Powernow-k8 doesn't work with 90nm Athlon64@939pin
	(Winchester)
Date: Fri, 3 Dec 2004 07:02:31 -0800
Message-ID: <200412031502.iB3F2VwD000401@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3855





------- Additional Comments From linux@brodo.de  2004-12-03 07:02 -------
Created an attachment (id=4207)
 --> (http://bugme.osdl.org/attachment.cgi?id=4207&action=view)
powernow-k8: handle invalid initial frequency/voltage pairs correctly

can you test this patch, please? It's queued for inclusion into Davej's
cpufreq-bk tree.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
