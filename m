From: "Mattia Dongili" <malattia@linux.it>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Tue, 29 Nov 2005 08:48:32 +0100 (CET)
Message-ID: <6978.83.103.117.254.1133250512.squirrel@picard.linux.it>
References: <88056F38E9E48644A0F562A38C64FB600671185B@scsmsx403.amr.corp.intel.com>
	<438B942B.2090100@tremplin-utc.net>
	<20051128234854.GA3423@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051128234854.GA3423@inferi.kami.home>
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
To: Mattia Dongili <malattia@linux.it>
Cc: davej@redhat.com, Eric Piel <eric.piel@tremplin-utc.net>, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk

On Tue, November 29, 2005 12:48 am, Mattia Dongili said:
[...]
> +                long long diff = (t2.tv_sec * MSEC_PER_SEC + t2.tv_usec) -
> +                        (t1.tv_sec * MSEC_PER_SEC + t1.tv_usec);

doh... as the name suggests it should really be USEC_PER_SEC...

-- 
mattia
:wq!
