From: Nicolas Capit <capitn@free.fr>
Subject: Re: ondemand: cpu load calculation with kernel processus
Date: Thu, 31 May 2007 20:57:51 -0500
Message-ID: <20070531205751.2f56da4d@localhost.localdomain>
References: <20070531165744.4bf6e18b@localhost.localdomain>
	<200705312057.45963.lenb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer:mime-version:content-type:content-transfer-encoding:sender;
	b=Qd2fVDIlEi9WxrWSZiz4MPrSCdNSTx29Ym2QFjQeYV1D48ql3YU7yrqLJiIp497yUzjmYCzI+HUkazktdGaJWzocIv57liWDCpmBjd/AVwZARd63BtM768x7honly4gL/I7KZFxEcmHmkaLqewJCEKmcAuT6eiFG8nOlIYal66Y=
In-Reply-To: <200705312057.45963.lenb@kernel.org>
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
To: Len Brown <lenb@kernel.org>
Cc: cpufreq@lists.linux.org.uk

On Thu, 31 May 2007 20:57:45 -0400
Len Brown <lenb@kernel.org> wrote:

> On Thursday 31 May 2007 17:57, Nicolas Capit wrote:
> > Hello,
> > 
> > I am running a Debian unstable with a kernel 2.6.21-1-686 and using
> > modules powernow_k8 and cpufreq_ondemand.
> > 
> > My configuration with the ondemand governor seems to work very well
> > except when my cpu is busy by the kernel processus kcryptd. The cpu is
> > 100% busy but the frequency is not increased.
> > (I am using the module dm_crypt to encrypt my home filesystem)
> > 
> > So my question is:
> > Does the ondemand governor calculate the load of the machine with user
> > level and *kernel* level processus?
> 
> both user and kernel time should count as busy time.
> 
> do the cpu stats exposed by top show that you have idle time available?

Ok I am sorry for the noise :-(
My program that get the CPU stats is buggy... with top, effectively the
CPU is 0% idle but 10%us and 90%wa
(wa : Amount of time the CPU has been waiting for I/O to complete.)

Except if increasing the CPU frequency will reduce I/O wait time, the
cpufreq_ondemand works well...


> 
> -Len
> 
