From: peetah_ml@club-internet.fr
Subject: wrong frequencies reported
Date: Sun, 25 Jul 2004 18:00:45 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.60.0407251752390.1202@cobra.turtle.fr>
References: <mailman.0.1090369064.29286.cpufreq@www.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <mailman.0.1090369064.29286.cpufreq@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hello,

During my migration to a 2.6.7 kernel, I've selected the speedstep-smi 
driver for my laptop (Nec versa Vxi) with a pentium III 750Mhz ( sspec 
SL53P) and a 440MX chipset. But the frequencies reported in 
/sys/devices/system/cpu/cpu0/cpufreq are wrong: max frequency is 4Mhz 
whereas min frequency is 0 Mhz

I googled a bit to find out why this is happenning, but i didn't find any 
explanations or solutions. Therefore, I'm coming to the source.

Is this a known issue with old speedstep processors ?


Pierre
