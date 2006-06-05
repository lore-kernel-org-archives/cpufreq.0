From: Sebastian Witt <hasw@hasw.net>
Subject: Re: [PATCH] cpufreq-nforce2 divider
Date: Mon, 05 Jun 2006 21:18:57 +0200
Message-ID: <448483A1.7090404@hasw.net>
References: <44831B78.6050407@hasw.net> <20060604234249.GB2823@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060604234249.GB2823@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Dave Jones wrote:
> 
> Ok, but for the sake of the changelog, can you explain why
> this is a good thing ?
> 

Alexander Choporov reported (06/01/06) that xdiv = 1 does not work on his Abit 
NF7S2. Although there shouldn't be much cases that lead to xdiv = 1.

Regards,
Sebastian
