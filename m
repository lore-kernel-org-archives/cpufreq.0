From: Dave Jones <davej@redhat.com>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 15:21:53 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040114152152.GB5496@redhat.com>
References: <99F2150714F93F448942F9A9F112634C080EF392@txexmtae.amd.com>
	<20040113230605.GM14674@redhat.com>
	<20040114101041.GB16737@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040114101041.GB16737@dominikbrodowski.de>
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
To: paul.devriendt@amd.com, pavel@ucw.cz, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Wed, Jan 14, 2004 at 11:10:41AM +0100, Dominik Brodowski wrote:
 > On Tue, Jan 13, 2004 at 11:06:05PM +0000, Dave Jones wrote:
 > > Part of the justification for cpufreq (at least on x86) was an alternative
 > > for when ACPI just doesn't work, or for when folks either don't want to,
 > > or can't run ACPI (through various other AML bugs for eg).
 > 
 > Except that the ACPI P-States implementation also uses the cpufreq
 > infrastructure.

Sure, but that came later.. 

		Dave
