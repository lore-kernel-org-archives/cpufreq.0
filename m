From: Dave Jones <davej@redhat.com>
Subject: Re: Another mobile stepping - speedstep works fine
Date: Fri, 20 Aug 2004 20:36:49 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040820193649.GN4148@redhat.com>
References: <20040820093344.GA2923@akamail.com>
	<1093008540.30854.37.camel@localhost.localdomain>
	<1093029685.25283.12.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1093029685.25283.12.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq list <cpufreq@www.linux.org.uk>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Fri, Aug 20, 2004 at 12:21:25PM -0700, Jeremy Fitzhardinge wrote:
 > On Fri, 2004-08-20 at 14:29 +0100, Alan Cox wrote:
 > > I just added the stepping and ran some testing. Its been running with
 > > cpuspeed daemon for a day now and seems fine.
 > 
 > Thanks.  The driver looks a bit different now, so I've recast the patch.
 > 
 > David, could you put this in your tree?

ACK. Merged, and queued for next weeks mainline cpufreq patchbomb.

		Dave
