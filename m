From: =?iso-8859-2?q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>
Subject: Re: powernow-k8 on Athlon64 3200+ (s939) stability problem...
	[SOLVED]
Date: Tue, 26 Apr 2005 18:17:47 +0200
Message-ID: <200504261817.47494.pytasz@lodz.home.pl>
References: <84EA05E2CA77634C82730353CBE3A843023AE1D6@SAUSEXMB1.amd.com>
	<200504260918.02662.pytasz@lodz.home.pl>
Reply-To: pytasz@lodz.home.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <200504260918.02662.pytasz@lodz.home.pl>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

It seems to have been memory problem after all.
I had one Hynix module (512MB, PC3200, non-ECC), today I changed it to two 
Kingston modules (one dual-channel set 2x512MB PC3200 non-ECC) and problem 
disappeared.

Michal.
