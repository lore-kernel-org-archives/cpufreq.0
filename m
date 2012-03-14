From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] : provide disable_cpufreq() function to
 disable the API.
Date: Wed, 14 Mar 2012 12:26:15 -0400
Message-ID: <20120314162615.GD16960@phenom.dumpdata.com>
References: <1331680720-18268-1-git-send-email-konrad.wilk@oracle.com>
 <1331680720-18268-2-git-send-email-konrad.wilk@oracle.com>
 <20120314142543.GB2371@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120314142543.GB2371@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, JBeulich@suse.com

On Wed, Mar 14, 2012 at 10:25:43AM -0400, Dave Jones wrote:
> On Tue, Mar 13, 2012 at 07:18:39PM -0400, Konrad Rzeszutek Wilk wrote:
>  > useful for disabling cpufreq altogether. The cpu frequency
>  > scaling drivers and cpu frequency governors will fail to register.
> 
> looks good to me. Are you ok with me taking 1/2 through cpufreq.git, and
> then you pushing the xen bit yourself ?

No trouble! Thanks!
> (or I could take them both if it makes things easier)
> 
> 	Dave
