From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Can you please try this powernow-k8.c patch ?
Date: Tue, 16 Nov 2004 22:07:12 +0100
Message-ID: <20041116210712.GA9343@dominikbrodowski.de>
References: <84EA05E2CA77634C82730353CBE3A84301539DCB@SAUSEXMB1.amd.com>
	<20041116203853.GV31422@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041116203853.GV31422@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Tue, Nov 16, 2004 at 09:38:53PM +0100, Bruno Ducrot wrote:
> Could you please test the attached little program?
>
> ducrot@poupoune:~/debug/cpufrequtils-0.1-pre2$ sudo ./debug/x86_64/powernow-k8-decode 0
> cpu 0 currently at 2200 MHz and 1500 mV
Cool.

> Dominik, is it OK to put it in your cpufrequtils after review?
Some review is below. I'd like to get someone from AMD to look over this as
well, though. It looks to be an excellent addition to the cpufrequtils
package.

> #include <stdio.h>
> static int get_fidvid(unsigned int cpu, unsigned int *fid, unsigned int *vid)
> {
> 	int err = 1;
> 	unsigned long long msr;
just curious: is this correct on 32 and 64 bit build?

> 	if (argc < 2) {
> 		printf("usage %s cpu\n", argv[0]);
> 		exit(1);
please make it default to cpu0 if there is no cpu specified (unless you
convince me otherwise)

Thanks,
	Dominik
