From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: debugging aid [Re: powernow-k8 problem]
Date: Tue, 16 Nov 2004 22:16:01 +0100
Message-ID: <20041116211601.GB9393@dominikbrodowski.de>
References: <84EA05E2CA77634C82730353CBE3A84301539C23@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301539C23@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Devriendt, Paul" <paul.devriendt@amd.com>
Cc: cpufreq@www.linux.org.uk

>To help verify this, you would need to build the driver for debug (edit the .c file
> and add #define DEBUG before the include of the powernow-k8.h
> file). Then it will spew tons more data which will be useful.

FYI: from 2.6.10-rc2 on, all you need is to enable CONFIG_CPU_FREQ_DEBUG and
pass the cpufreq.debug=2 option on the command line (or modify
/sys/modules/cpufreq/parameters/debug )

	Dominik
