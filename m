From: "Andy Spencer" <andy753421@gmail.com>
Subject: Re: Cannot set max cpu frequency
Date: Wed, 25 Jul 2007 03:58:35 +0000
Message-ID: <490dd6310707242058n310fc4b5x1beee6605a3c5fc4@mail.gmail.com>
References: <490dd6310707230943n753b8955q3f20fd24ce6f5314@mail.gmail.com>
	<1185283417.4023.21.camel@noname>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=blCwVWsCguzzm+iSmlcRwOxqwF8bMrUcloEQLzUBY8x0nQK/tl6dkhjVNOErZr1w58Dhc8UkXTo6dpuYpf//W3afdam8YuqOy6dfsIkyoeaLLkuVdoRJaLlkLPvkklEoK6Fk6isS8DK/bOoBoqahfQ3Zwg6freUy37xxfvD14Ec=
In-Reply-To: <1185283417.4023.21.camel@noname>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk

> It could be that cpufreq gets limited, because of temperature limits.
> But this is unlikely (49 C and so much freq steps, making sure the fan
> slots are clean is still a good idea).

A couple hours after posting that message I noticed that the battery
light was blinking orange/green. According to the Dell website that
means that the battery was to hot to charge. I think this may have
been the problem, however I'm at a loss to what exactly happened. I
had my computer plugged in the whole time so I don't know why it would
be hot or trying to charge. All the other temperature sensors
(thm,sda,i8k,gpu) were within normal ranges. To be honest I didn't
even know there was a temperature sensor on the battery.
