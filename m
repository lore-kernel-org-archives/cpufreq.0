From: Dave Jones <davej@redhat.com>
Subject: Re: Mobile Celeron
Date: Tue, 13 Mar 2007 16:27:58 -0400
Message-ID: <20070313202758.GA18519@redhat.com>
References: <50df9eb80703121320k182b0aa9x8fd7c6c7969384d7@mail.gmail.com>
	<20070313013801.GA5364@tatooine.rebelbase.local>
	<50df9eb80703131114wcff0a56g1d93499531eee9a@mail.gmail.com>
	<20070313190121.GD27471@redhat.com>
	<50df9eb80703131233u6b1a3c87r5a759cdf8e89c097@mail.gmail.com>
	<20070313194200.GB10653@redhat.com>
	<50df9eb80703131247s3e618640y6f0c74e76c11d5e3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <50df9eb80703131247s3e618640y6f0c74e76c11d5e3@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Ralf Meyer <ranfyy@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Mar 13, 2007 at 08:47:00PM +0100, Ralf Meyer wrote:

This is really suspect..

 >  	if (*low_speed == *high_speed) {
 > -		ret = -ENODEV;
 > +		dprintk("low speed is same as high speed?\n");
 > +		/* Workaround for celeron-M */
 > +		//ret = -ENODEV;
 >  		goto out;
 >  	}

So it has low speed == high speed ? Then what's the point ?
Very strange.

	Dave

-- 
http://www.codemonkey.org.uk
