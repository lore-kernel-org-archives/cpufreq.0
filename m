From: Dave Jones <davej@redhat.com>
Subject: Re: [patch] Re: 2.6.7-mm2 build errors...
Date: Sat, 3 Jul 2004 12:39:01 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040703113901.GO7101@redhat.com>
References: <40DCEFFB.5020605@fibertel.com.ar>
	<20040702205129.GK28324@fs.tum.de>
	<20040702140322.2ab47867.rddunlap@osdl.org>
	<20040702215024.GL28324@fs.tum.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040702215024.GL28324@fs.tum.de>
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
To: Adrian Bunk <bunk@fs.tum.de>
Cc: "Randy.Dunlap" <rddunlap@osdl.org>, limaunion@fibertel.com.ar, water modem <lundby@ameritech.net>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

On Fri, Jul 02, 2004 at 11:50:24PM +0200, Adrian Bunk wrote:

 > > but my patch was insufficient:
 > > http://marc.theaimsgroup.com/?l=linux-kernel&m=108753512102539&w=2
 > > 
 > > See reply from Dave Jones.  And I see what he means, but I don't
 > > see how to express it in Kconfig language.
 > 
 > What about the patch below?

Looks good, I'll give it a test later, and roll it into cpufreq-bk
and let it simmer in -mm for a few days.  (There's a bunch of other
cpufreq bits that have backlogged which I also need to get some
testing of).

		Dave
