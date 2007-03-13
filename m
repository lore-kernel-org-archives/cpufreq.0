From: "Ralf Meyer" <ranfyy@gmail.com>
Subject: Re: Mobile Celeron
Date: Tue, 13 Mar 2007 19:14:16 +0100
Message-ID: <50df9eb80703131114wcff0a56g1d93499531eee9a@mail.gmail.com>
References: <50df9eb80703121320k182b0aa9x8fd7c6c7969384d7@mail.gmail.com>
	<20070313013801.GA5364@tatooine.rebelbase.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=jlppfI/AdFYti2G1hj9wzIOitnjZcikYRKjioAA9mmpBVnPFSJhazfuSyBZilDA3lqFG/63rLkryuGitHBQEhRGbN8rZwnZ7nXcBX4i1qXl0fXBPz8BLomTJgdGTxV921Wh37D9c24RqUYudeoJZkRh8ThWEfsMRgP4KP6gnb8M=
In-Reply-To: <20070313013801.GA5364@tatooine.rebelbase.local>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

On 3/13/07, markus reichelt <ml@mareichelt.de> wrote:
> * Ralf Meyer <ranfyy@gmail.com> wrote:
>
> > is a Mobile Celeron supposed to be able to do CPU frequency
> > scaling?
>
> run cpuid and check for something like Enhanced Intel SpeedStep
> Technology
>
> cpuid @ http://www.etallen.com/cpuid.html

Thanks. I didn't know this tool.

$ cpuid | grep -i speed     # gave me:
---
      Enhanced Intel SpeedStep Technology    = false
---

Its man page led me to the Datasheet (29851706.pdf). In the Power
Management chapter there is no mention of speedstep or enhanced
speedstep but something called Quickstart. I never heard about this
before.

Does Quickstart work all by itself?

My original question should have been clearer in that I wanted to know
if the hardware is capable of frequency scaling of some sort.
