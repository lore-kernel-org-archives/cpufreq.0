From: Luigi Belli <lbelli@crema.unimi.it>
Subject: Re: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Tue, 1 Jul 2003 01:20:18 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307010120.19091.lbelli@crema.unimi.it>
References: <200306301436.29188.lbelli@crema.unimi.it> <20030701005946.5e659273.frx@firenze.linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030701005946.5e659273.frx@firenze.linux.it>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

On Tuesday 01 July 2003 12:59 am, Francesco Poli wrote:

> Does anybody know a simple method to check if the BIOS is buggy or not?

Well... simply look at syslog and see if the frequencies are correct... for my 
BIOS my cpu has 5 steps: 4 at 500Mhz and 1 at 600Mhz, all at 1,4V.
That's obviously wrong...
