From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Tue, 10 May 2005 22:38:45 -0400
Message-ID: <20050511023845.GB25506@redhat.com>
References: <20050510223031.GA4478@inskipp> <20050511013044.GA8039@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050511013044.GA8039@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Alexander Clouter <alex@digriz.org.uk>
Cc: cpufreq@lists.linux.org.uk, linux@dominikbrodowski.de, alex-kernel@digriz.org.uk

On Tue, May 10, 2005 at 09:30:45PM -0400, Dave Jones wrote:
 > On Tue, May 10, 2005 at 11:30:31PM +0100, Alexander Clouter wrote:
 >  > Adds support to cpufreq_ondemand to ignore 'nice' cpu time
 >  > 
 >  > Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>
 >  > 
 >  
 > quoted-printable (more like unprintable) patches tend to get
 > horribly mangled.  This is what they ended up like..
 > 
 > @@ -193,6 +195,46 @@
 >     return count;
 >  }
 > =20
 > +static ssize_t store_ignore_nice(struct cpufreq_policy *policy,
 > +       const char *buf, size_t count)
 > +{
 > +   unsigned int input;
 > +   int ret;
 > +
 > +   unsigned int j;
 > +=09
 > +   ret =3D sscanf (buf, "%u", &input);
 > +   if ( ret !=3D 1 )
 > +       return -EINVAL;
 > +
 > +   if ( input > 1 )
 > +       input =3D 1;
 > +=09
 > 
 > 
 > (Note the =20/09 crap)
 > 
 > Please resend with a different mailer if necessary.

Ignore this, I ran them through mutt on a different box, and
they showed up just fine. Wierd.

		Dave
