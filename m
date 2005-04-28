From: Andrew Morton <akpm@osdl.org>
Subject: Re: Merging status.
Date: Thu, 28 Apr 2005 16:03:27 -0700
Message-ID: <20050428160327.285fd3f8.akpm@osdl.org>
References: <20050428203740.GE8514@redhat.com>
	<20050428144540.62936aa8.akpm@osdl.org>
	<20050428221329.GD15706@redhat.com>
	<20050428154033.248b5087.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050428154033.248b5087.akpm@osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: davej@redhat.com, cpufreq@lists.linux.org.uk

Andrew Morton <akpm@osdl.org> wrote:
>
> For some bizarre reason, your http server manages to break wget.
> 
> 	wget -r http://www.codemonkey.org.uk/projects/cpufreq/pending-patches
> 
> doesn't fetch the patches.  Confused.

Still confused, but with mpm's help, managed to work out that

	lftp -e "mget *" "$URL" < /dev/null

did the trick.
