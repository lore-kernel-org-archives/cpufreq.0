From: Dave Jones <davej@redhat.com>
Subject: Re: A patch to support centrino 1GHz
Date: Mon, 27 Oct 2003 19:17:42 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031027191742.GA4518@redhat.com>
References: <3F9C805C.4040507@granite.phys.s.u-tokyo.ac.jp>
	<1067244131.782.1.camel@ixodes.goop.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1067244131.782.1.camel@ixodes.goop.org>
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
Cc: Youichi Aso <aso@granite.phys.s.u-tokyo.ac.jp>, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, Oct 27, 2003 at 12:42:11AM -0800, Jeremy Fitzhardinge wrote:

 > > This works fine with my laptop.
 > > I looked up the frequency-voltage table for the processor in the revised 
 > > version of Pentium M data sheet, 252612-002.pdf, from Intel.
 > Looks good to me.  Dave, please apply.

Done. Linus hasn't been taking things like PCI ID updates and the likes
for the last few weeks however, so this may have to wait until post 2.6.0
In the meantime, it'll sit in the cpufreq tree waiting to be pulled.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
