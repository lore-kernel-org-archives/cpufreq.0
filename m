From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5353] cpufreq_conservative: cpu always in slowest mode even
	under high load
Date: Tue, 10 Jan 2006 14:22:48 -0800
Message-ID: <200601102222.k0AMMmcx005275@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5353





------- Additional Comments From bugzilla.kernel.org@CustomCDROM.de  2006-01-10 14:11 -------
Mh, I thought conservative was completely broken. To be honest, on both of my 
machines - a Celeron M notebook and my AMD64 Winchester - switching to 
conservative with standard settings causes the CPU to immediately enter the 
lowest speed setting and never changing back, independant of the load. Thus 
I'm using ondemand which works flawlessly. (Both 2.6.13.x and 1.6.14.x vanilla 
kernel versions.) 
 
Hoping the bug isn't just sitting in front of my keyboard, is there any way I 
could help to debug the problems? Patching or rebuilding the kernel would be 
no problem if neccessary, however I'm just in the middle of preparing for an 
examn and have not too much time to fiddle with tings myself ATM. :-( 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
