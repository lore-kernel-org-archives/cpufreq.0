From: Muskat Nuss <muskatnuss@gmx.at>
Subject: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change Frequency!
Date: Fri, 25 May 2007 00:14:24 +0200
Message-ID: <1180044864.16204.11.camel@Tux-Devil>
Reply-To: muskatnuss@gmx.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Distribution: Ubuntu x86_64 Newest Stable release
Hardware: Laptop Fujistu-Siemens Amilo Pa 1510
Problem: so the driver correctly detects the two available
frequencies (800 & 1600 MHz), any governor will always use the lowest
one.
Well in Suse 10.2 i rebuild the kernel with the powernowd module for AMD
64
with powernow! @ this time the cpu always ran on 1.6 GHz but I wasn able
to
change the Frequency to 800 MHz. 
Now I'm stack I can switch between 800 and 800MHz, whatever i do!

I thought I'm not the only guy with that problem... but how do i fix
this problem?
already ran a bios update to 1.07 newest version for my Notebook.
All modules a loaded and running. Powernow-k8, powernowd, also the
userspace governor
and the cpufreq module! 

greetz muskatnuss. /*sry for wrong posting if done > new to this scene*/
