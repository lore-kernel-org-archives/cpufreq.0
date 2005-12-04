From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 1/2] Move PMBASE reading away and do it only once at
	initialization time
Date: Sun, 4 Dec 2005 17:58:42 +0100
Message-ID: <20051204165842.GD8422@isilmar.linta.de>
References: <11333087112659-git-send-email-malattia@linux.it>
	<438D86E3.9070502@lifl.fr> <20051130210059.GC3620@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051130210059.GC3620@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Piel <Eric.Piel@lifl.fr>, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Eric Piel <eric.piel@tremplin-utc.net>, davej@redhat.com

On Wed, Nov 30, 2005 at 10:00:59PM +0100, Mattia Dongili wrote:
> On Wed, Nov 30, 2005 at 12:02:59PM +0100, Eric Piel wrote:
> [...]
> > >@@ -400,6 +415,10 @@ static int __init speedstep_init(void)
> > > 		return -EINVAL;
> > > 	}
> > > 
> > >+	if (speedstep_find_register()) {
> > >+		return -ENODEV;
> > >+	}
> > >+
> > Please, keep it simple and do put { and } when there is only one line.
> 
> I assume you meant "do not put" :)
> attached the fixed patch (with removed extra white space also).
> 
> This patch moves away PMBASE reading and only performs it at
> cpufreq_register_driver time by exiting with -ENODEV if unable to read                                                                                
> the value.
> 
> Signed-off-by: Mattia Dongili <malattia@linux.it>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>
