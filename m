From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: cpufreq on-demand governor up_treshold?
Date: Mon, 14 Mar 2005 23:39:45 +0100
Message-ID: <20050314223945.GC13378@isilmar.linta.de>
References: <200503140829.04750.lkml@kcore.org>
	<42354400.7070500@tremplin-utc.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42354400.7070500@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, Jan De Luyck <lkml@kcore.org>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Mon, Mar 14, 2005 at 08:57:52AM +0100, Eric Piel wrote:
> BTW, DaveJ, Dominik, I couldn't find them in the daily-snapshot 
> available at codemonkey.org.uk. Should I worry, or is it just due to 
> some latency between your private trees and the public one?

/me has no official position wrt cpufreq core [except userspace
cpufrequtils, but I intend to hand this over to somebody else in the next
few months].

Dave, as maintainer of cpufreq, has a cpufreq bitkeeper tree [http interface
at http://linux-dj.bkbits.net/ ] which is exported as plain diff daily at
http://www.codemonkey.org.uk/projects/cpufreq/daily-snapshots/ . This does
not contain your patches yet, probably because he's still busy with other
stuff.

Thanks,
	Dominik
