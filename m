From: Dave Jones <davej@redhat.com>
Subject: Re: post-OLS pending cpufreq patches
Date: Mon, 2 Aug 2004 21:52:08 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040802205208.GE12724@redhat.com>
References: <20040727205126.GB9438@dominikbrodowski.de>
	<20040802193350.GA15740@redhat.com>
	<20040802204231.GB8795@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040802204231.GB8795@dominikbrodowski.de>
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
To: venkatesh.pallipadi@intel.com, cpufreq@www.linux.org.uk

On Mon, Aug 02, 2004 at 10:42:31PM +0200, Dominik Brodowski wrote:
 > On Mon, Aug 02, 2004 at 08:33:50PM +0100, Dave Jones wrote:
 > >  > - [speedstep-centrino] SMP support [Venkatesh Pallipadi]
 > >  > 	looks good, IMO, but needs to be adapted to Jeremey's patch which
 > >  > 	should go in first, IMO.
 > > 
 > > merged.
 > 
 > Actually, I can't see that in either bk or snapshot... However, I guess it
 > needs a bit of re-work after all the changes done in the past few hours.

Ok, I'm done merging bits for now, and I've just refreshed the patch
at http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/cpufreq-2004-08-02.diff
if you have anything else, please send incrementals against that.

Hmm, actually, there's going to be one more fix needed.
Something I just merged broke things. (Or I missed a dependancy).

  CC      arch/i386/kernel/cpu/cpufreq/speedstep-ich.o
  arch/i386/kernel/cpu/cpufreq/speedstep-ich.c: In function `speedstep_target':
  arch/i386/kernel/cpu/cpufreq/speedstep-ich.c:250: warning: implicit declaration of function `speedstep_get'
  arch/i386/kernel/cpu/cpufreq/speedstep-ich.c: At top level:
  arch/i386/kernel/cpu/cpufreq/speedstep-ich.c:363: error: conflicting types  2


		Dave
