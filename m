From: Vegar Lauritzsen <laurits@stud.ntnu.no>
Subject: Setting speed on Xscale
Date: Tue, 1 Jul 2003 21:20:39 +0200 (CEST)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.51.0307011728510.10374@puma.stud.ntnu.no>
References: <37FBBA5F3A361C41AB7CE44558C3448E0714BA@pdsmsx403.ccr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <37FBBA5F3A361C41AB7CE44558C3448E0714BA@pdsmsx403.ccr.corp.intel.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk


Hi, does anyone have experiece on setting the cpu speed on the PXA-250.
I'm trying to set my PXA-250 to the different speedlevels used in
power-saving. I would like to be able to do some teste on my system while
decreasing the max speed setting.
As for now the only solution I see is to modify the table in cpu-pxa.c
(from I-linux-2.4.18) and make four different compilations of the
kernel for each max-speed setting.
Is there a nother way?

The novice

-Vegar


ps! Thanks Chain Yuan for pointing me to the right file
