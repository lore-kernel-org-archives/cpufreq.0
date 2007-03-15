From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8075] powernow-k8: MP systems not supported by PSB BIOS
	structure
Date: Thu, 15 Mar 2007 13:02:39 -0700
Message-ID: <200703152002.l2FK2d4i022234@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8075





------- Additional Comments From yann@kierun.org  2007-03-15 13:02 -------
All the pictures I've just uploaded are from a Fedor Core 6 install DVD.  There
are two trace, the first is from the default kernel, the second from booting
with "linux text apci=off smp=off" to remove as many things as possible. 
Gentoo, Open Suse and Ubuntu all kernel dump as well.  If you really want and it
would help, I can take pictures of all of them. 

The system I am running is as follows:
 AMD Athlon 64 X2 Dual Core 5000+
 MSI K9A Platinum Crossfire (Socket AM2)
 OCZ 2GB (2 x 1GB) PC2-6400 Dual Channel Platinu
 Sapphire ATI Radeon X1950 Pro ULTIMATE SILENT

I'd love to be able to compile a 2.6.21 kernel (or any other) but I cannot
install Linux so do not have access to gcc or anything like that. 

Any help would be much appreciated.  

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
