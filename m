From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: [PATCH] fix double unlock of cpu_policy_rwsem in
	drivers/cpufreq/cpufreq.c
Date: Thu, 29 May 2008 12:10:42 -0400
Message-ID: <20080529161042.GC16229@codemonkey.org.uk>
References: <18494.53708.856316.841696@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <18494.53708.856316.841696@ipc1.ka-ro>
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
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: cpufreq@lists.linux.org.uk

On Thu, May 29, 2008 at 05:54:52PM +0200, Lothar Wa=DFmann wrote:
 > Hi,
 > =

 > [this message was also sent to the linux-kernel mailing list]
 > =

 > In drivers/cpufreq/cpufreq.c the function cpufreq_add_dev() takes the
 > error exit 'err_out_unregister' from different places once with the
 > 'cpu_policy_rwsem' lock held, once with the lock released:

Ah, yes. Dumb bug.  Thanks, applied, and queued for Linus.

	Dave

-- =

http://www.codemonkey.org.uk
