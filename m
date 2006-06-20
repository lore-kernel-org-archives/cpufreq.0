From: Dave Jones <davej@redhat.com>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable
	Enchanced SpeedStep
Date: Tue, 20 Jun 2006 01:33:55 -0400
Message-ID: <20060620053355.GB6091@redhat.com>
References: <200606191610.40597.ben.kevan@gmail.com>
	<20060619231323.GC17134@redhat.com>
	<200606191807.14091.ben.kevan@gmail.com>
	<b360fed70606192224w63f27116k986ca579ddf9ed5e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <b360fed70606192224w63f27116k986ca579ddf9ed5e@mail.gmail.com>
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
To: Ben Kevan <ben.kevan@gmail.com>
Cc: cpufreq@lists.linux.org.uk, linux@brodo.de

On Mon, Jun 19, 2006 at 10:24:21PM -0700, Ben Kevan wrote:
 > Hi Dave,
 > 
 > I installed 2.6.17 and kept the Kernel Vanilla, and still came up with the
 > same output as the originating message, here is the dmesg output with
 > cpufreq.debug=7:
 >  ..
 > Unknown boot option `cpufreq.debug=7': ignoring

make sure that CPU_FREQ_DEBUG is set in your .config

		Dave

-- 
http://www.codemonkey.org.uk
