From: Dave Jones <davej@redhat.com>
Subject: Re: How can I guess the system FSB speed?
Date: Tue, 14 Mar 2006 18:40:27 -0500
Message-ID: <20060314234027.GB8659@redhat.com>
References: <200603150018.33139.danielrubiob@terra.es>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200603150018.33139.danielrubiob@terra.es>
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
To: Daniel Rubio Bonilla <danielrubiob@terra.es>
Cc: cpufreq@lists.linux.org.uk

On Wed, Mar 15, 2006 at 12:18:33AM +0100, Daniel Rubio Bonilla wrote:
 > Hi to everyone. I am new in this mailing list.
 > 
 > I would like to ask how could I guess the speed of the FSB of the system, if 
 > there is any way...

you can't reliably.  the best you can hope for is to decode the EBLCR MSR
if present.  Unfortuantly, it has different meaning on pretty much
every CPU out there, which makes it a bit of a mess to decode.

		Dave

-- 
http://www.codemonkey.org.uk
