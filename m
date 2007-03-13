From: "Ralf Meyer" <ranfyy@gmail.com>
Subject: Re: Mobile Celeron
Date: Tue, 13 Mar 2007 21:46:13 +0100
Message-ID: <50df9eb80703131346u547905cgdfc8e0c01b721901@mail.gmail.com>
References: <50df9eb80703121320k182b0aa9x8fd7c6c7969384d7@mail.gmail.com>
	<20070313013801.GA5364@tatooine.rebelbase.local>
	<50df9eb80703131114wcff0a56g1d93499531eee9a@mail.gmail.com>
	<20070313190121.GD27471@redhat.com>
	<50df9eb80703131233u6b1a3c87r5a759cdf8e89c097@mail.gmail.com>
	<20070313194200.GB10653@redhat.com>
	<50df9eb80703131247s3e618640y6f0c74e76c11d5e3@mail.gmail.com>
	<20070313202758.GA18519@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=sD0alI59tGioql+ePXekZbmjwkN8tqvZBcJ5GQFLz75RA8EEyi1EWdynHReHnXOi05+HsodbEivMlVAwemBrYE3GlOmIxO56aSHQXP9h14TCsKSUIaDYmWV9Fqi9GaXjk+pWGU46MnqdNL5SEFU5V1c5joxZlNahpSL/cYxiXJg=
In-Reply-To: <20070313202758.GA18519@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

On 3/13/07, Dave Jones <davej@redhat.com> wrote:
> On Tue, Mar 13, 2007 at 08:47:00PM +0100, Ralf Meyer wrote:
>
> This is really suspect..
>
>  >      if (*low_speed == *high_speed) {
>  > -            ret = -ENODEV;
>  > +            dprintk("low speed is same as high speed?\n");
>  > +            /* Workaround for celeron-M */
>  > +            //ret = -ENODEV;
>  >              goto out;
>  >      }
>
> So it has low speed == high speed ? Then what's the point ?
> Very strange.

I can't tell you who hacked that up. trainee (intern?) I have no idea.
