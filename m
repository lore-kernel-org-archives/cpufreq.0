From: Dave Jones <davej@redhat.com>
Subject: Re: enhanced intel speedstep feature was Re: speedstep-centrino on
	dothan
Date: Thu, 7 Jul 2005 16:40:17 -0400
Message-ID: <20050707204017.GB29142@redhat.com>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com> <20050706211159.GF27630@redhat.com>
	<20050706235557.0c122d33@horst.morte.male>
	<20050707220027.413343d4@horst.morte.male>
	<20050707200648.GA29142@redhat.com>
	<20050707222225.5b3113e0@horst.morte.male>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050707222225.5b3113e0@horst.morte.male>
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
To: st3@riseup.net
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Thu, Jul 07, 2005 at 10:22:25PM +0200, st3@riseup.net wrote:

 > > This hasn't been seen to save any power whatsoever that I've seen.
 > 
 > It drops down power rating by 1500-1800mW on my Toshiba Satellite A50
 > while idling at 400MHz.
 > 
 > > I've heard a few reports that it reduces heat for a few folks, but
 > > betting on it increasing your battery life is probably a push.
 > 
 > Just a latest question: can be p4-clockmod used together with
 > speedstep-centrino? If not, would it make any sense to patch
 > speedstep-centrino to use this feature too?

There was some discussion on cpufreq list long ago to make cpufreq
drivers stackable, but it's never been a high enough priority for
anyone to actually do the work.

		Dave
