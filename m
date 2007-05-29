From: Muskat Nuss <muskatnuss@gmx.at>
Subject: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change Frequency!
Date: Tue, 29 May 2007 21:15:05 +0200
Message-ID: <1180466105.8401.5.camel@Tux-Devil>
References: <1180379564.5763.8.camel@Tux-Devil>
	<1449F58C868D8D4E9C72945771150BDF02076E14@SAUSEXMB1.amd.com>
Reply-To: muskatnuss@gmx.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1449F58C868D8D4E9C72945771150BDF02076E14@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

my cpufreq directory says:

cpuinfo_cur_freq
800000

cpuinfo_max_freq
1600000

cpuinfo_min_freq
800000

scaling_cur_freq
800000

scaling_driver
powernow-k8

scaling_max_freq
800000

scaling_min_freq
800000

affected_cpus
0 1

so but i've already tried to change the scaling_max_freq to 1600000 but
nothing happens @ su mode.
if i add an line with 
echo 1600000 > /sys/devices...../cpufreq/scaling_max_freq
at booting before entering init 1 modus ... nothing happens or it says 
directory or file not found.

so im not able to change this file. 
