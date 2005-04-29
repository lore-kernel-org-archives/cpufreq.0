From: Andrew Morton <akpm@osdl.org>
Subject: Re: Merging status.
Date: Thu, 28 Apr 2005 17:09:49 -0700
Message-ID: <20050428170949.4086ec86.akpm@osdl.org>
References: <20050428203740.GE8514@redhat.com>
	<20050428144540.62936aa8.akpm@osdl.org>
	<20050428221329.GD15706@redhat.com>
	<20050428154033.248b5087.akpm@osdl.org>
	<20050428235051.GC1730@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050428235051.GC1730@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Dave Jones <davej@redhat.com> wrote:
>
>  > For some bizarre reason, your http server manages to break wget.
>  > 
>  > 	wget -r http://www.codemonkey.org.uk/projects/cpufreq/pending-patches
>  > 
>  > doesn't fetch the patches.  Confused.
> 
> Fixed.

What was the cause?

(I might stick with lftp anyway - seems quicker, is less noisy and `wget
-r' has a habit of wanting to fetch the entire internet).
