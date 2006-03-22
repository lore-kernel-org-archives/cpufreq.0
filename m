From: Andrew Morton <akpm@osdl.org>
Subject: Re: [patch 1/4] cpufreq_conservative: update and align of codebase
Date: Wed, 22 Mar 2006 01:22:10 -0800
Message-ID: <20060322012210.1c0fb11f.akpm@osdl.org>
References: <20060322085807.GA10689@inskipp.digriz.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060322085807.GA10689@inskipp.digriz.org.uk>
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
To: Alexander Clouter <alex@digriz.org.uk>
Cc: cpufreq@lists.linux.org.uk, linux@dominikbrodowski.de, linux-kernel@vger.kernel.org

Alexander Clouter <alex@digriz.org.uk> wrote:
>
> *NEW* patches, for kernel 2.6.16
> 
>  Something I had been meaning to do for a while.  The codebases between
>  ondemand and conservative have strayed and as Venkatesh has far more Clue(tm)
>  than I am going to adjust my code to look more like his :)
> 
>  Another reason to do this is ages ago, knowingly, I did a piss poor attempt
>  at making conservative less responsive by knocking up
>  DEF_SAMPLING_RATE_LATENCY_MULTIPLIER by two orders of magnitude.  I did fix
>  this ages ago but in my dis-organisation I must have toasted the diff and
>  left it the way it was.  About two weeks ago a user contacted me saying he
>  was having problems with the conservative governor with his AMD Athlon XP-M
>  2800+ as /sys/devices/system/cpu/cpu0/cpufreq/conservative showed
>    sampling_rate_min   9950000
>    sampling_rate_max   1360065408
> 
>  Nine seconds to decide about changing the frequency....not too responsive :)

umm, that's not really a changelog.  Please, see
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt.  Section 2a is
relevant too..

Thanks.
